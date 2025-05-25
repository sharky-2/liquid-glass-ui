<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="static/css/root.css">
    <link rel="stylesheet" href="static/css/style.css">
    <link rel="stylesheet" href="static/css/design.css">
</head>
<body>
    
    <div id="card-grid">
        <section class="card-section">
            <?php
                $servername = "localhost"; 
                $username = "root";
                $password = "";
                $dbname = "prodajalna_avto"; 

                $conn = new mysqli($servername, $username, $password, $dbname);

                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                $sql = "
                    SELECT 
                        r.id_račun,
                        CONCAT(k.ime, ' ', k.priimek) AS kupec,
                        p.ime AS prodajalna,
                        r.cena,
                        r.popust,
                        r.datum_nakupa,
                        s.naziv AS servis,
                        s.cena AS cena_servisa,
                        v.slika AS car_img
                    FROM Racun r
                    JOIN Kupec k ON r.kupec_id = k.id_kupec
                    JOIN Prodajalna p ON r.prodajalna_id = p.id_prodajalna
                    JOIN Avto_servis s ON r.servis_povezava_id = s.id_servus
                    LEFT JOIN Vozila v ON v.prodajalna_id = p.id_prodajalna
                ";

                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $invoiceId = htmlspecialchars($row['id_račun']);
                        $customer = htmlspecialchars($row['kupec']);
                        $dealer = htmlspecialchars($row['prodajalna']);
                        $price = htmlspecialchars($row['cena']);
                        $discount = htmlspecialchars($row['popust']);
                        $purchaseDate = htmlspecialchars($row['datum_nakupa']);
                        $serviceName = htmlspecialchars($row['servis']);
                        $servicePrice = htmlspecialchars($row['cena_servisa']);
                        $carImage = htmlspecialchars($row['car_img'] ?: 'default-car.jpg'); // fallback image

                        echo '
                        <div class="card">
                            <div class="text-section">
                                <label class="text-design">
                                    🧾 Invoice ID: ' . $invoiceId . '<br>
                                    👤 Customer: ' . $customer . '<br>
                                    🏪 Dealer: ' . $dealer . '<br>
                                    💶 Price: <span style="color: #0073ff; font-weight: bold;">' . $price . ' €</span> | Discount: ' . $discount . '<br>
                                    📅 Purchase Date: ' . $purchaseDate . '<br>
                                    🛠️ Service: ' . $serviceName . ' (' . $servicePrice . ' €)
                                </label>
                            </div>

                            <img src="' . $carImage . '" alt="Car Image">

                        </div>
                        ';
                    }
                } else {
                    echo "<p>No orders found.</p>";
                }

                $conn->close();
            ?>
        </section>
    </div>


    <script>
    document.addEventListener("DOMContentLoaded", function () {
        const buttons = document.querySelectorAll(".button");

        buttons.forEach(button => {
            button.addEventListener("click", function () {
                // Hide all cards
                document.querySelector(".card-section").style.display = "none";

                // Fetch and show order details
                fetch("orderDetails.php")
                    .then(response => response.text())
                    .then(data => {
                        const container = document.getElementById("order-details-container");
                        container.innerHTML = data;
                        container.style.display = "block";
                    })
                    .catch(error => {
                        console.error("Error fetching order details:", error);
                    });
            });
        });
    });
    </script>

</body>
</html>