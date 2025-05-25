<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>GearRush</title>
    <link rel="stylesheet" href="static/css/root.css" />
    <link rel="stylesheet" href="static/css/style.css" />
    <link rel="stylesheet" href="static/css/design.css" />
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

        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_car'])) {
            $znamka = $conn->real_escape_string($_POST['znamka']);
            $model = $conn->real_escape_string($_POST['model']);
            $letnik = (int)$_POST['letnik'];
            $motor = $conn->real_escape_string($_POST['motor']);
            $gorivo = $conn->real_escape_string($_POST['gorivo']);
            $menjalnik = $conn->real_escape_string($_POST['menjalnik']);
            $kilometri = (int)$_POST['kilometri'];
            $cena = (float)$_POST['cena'];
            $opis = $conn->real_escape_string($_POST['opis']);
            $slika = $conn->real_escape_string($_POST['slika']);

            // New required fields
            $zaloga = (int)$_POST['zaloga'];
            $pogon = $conn->real_escape_string($_POST['pogon']);
            $notranjost = $conn->real_escape_string($_POST['notranjost']);
            $oprema = $conn->real_escape_string($_POST['oprema']);
            $stanje = $conn->real_escape_string($_POST['stanje']);
            $dobavitelj_id = (int)$_POST['dobavitelj_id'];

            // Random prodajalna for now
            $prodajalna_id = rand(1, 5);

            $insert_sql = "
                INSERT INTO Vozila (
                    znamka, model, letnik, cena, zaloga,
                    opis, motor, menjalnik, gorivo, pogon,
                    kilometri, notranjost, oprema, stanje,
                    dobavitelj_id, prodajalna_id, slika
                ) VALUES (
                    '$znamka', '$model', $letnik, $cena, $zaloga,
                    '$opis', '$motor', '$menjalnik', '$gorivo', '$pogon',
                    $kilometri, '$notranjost', '$oprema', '$stanje',
                    $dobavitelj_id, $prodajalna_id, '$slika'
                )
            ";

            if ($conn->query($insert_sql) === TRUE) {
                echo "<p style='color: green;'>New car added successfully!</p>";
            } else {
                echo "<p style='color: red;'>Error adding car: " . $conn->error . "</p>";
            }
        }

        // Fetch and display all cars
        $sql = "
            SELECT 
                v.znamka,
                v.model,
                v.letnik,
                v.motor,
                v.gorivo,
                v.menjalnik,
                v.kilometri,
                v.cena,
                v.opis,
                v.slika,
                p.ime AS prodajalna
            FROM Vozila v
            JOIN Prodajalna p ON v.prodajalna_id = p.id_prodajalna
        ";

        $result = $conn->query($sql);

        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $carZnamka = htmlspecialchars($row['znamka']);
                $carModel = htmlspecialchars($row['model']);
                $carYear = htmlspecialchars($row['letnik']);
                $carMotor = htmlspecialchars($row['motor']);
                $carGorivo = htmlspecialchars($row['gorivo']);
                $carMenjalnik = htmlspecialchars($row['menjalnik']);
                $carKilometri = htmlspecialchars($row['kilometri']);
                $carPrice = htmlspecialchars($row['cena'] ?? '');
                $carDescription = htmlspecialchars($row['opis'] ?? '');
                $carImage = htmlspecialchars($row['slika']);
                $carDealer = htmlspecialchars($row['prodajalna']);

                echo '
                <div class="card">
                    <div class="text-section">
                        <label class="text-design">
                            🚗 For Sale: ' . $carYear . ' ' . $carZnamka . ' ' . $carModel . ' | ' . $carGorivo . ' ' . $carMenjalnik . ' ' . $carMotor . ' ' . $carKilometri . 'km - 
                            <label class="text-design" style="color: #0073ff; font-weight: bold;">' . $carPrice . ' EURO</label><br>
                        </label><br>
                        <label class="text-design">' . $carDescription . '</label>
                    </div>
                    
                    <img src="' . $carImage . '" alt="Car Image">

                    <div class="prodajalna text-section">
                        <label class="text-design">' . $carDealer . '</label>
                    </div>
                </div>
                ';
            }
        } else {
            echo "<p>No cars found.</p>";
        }

        $conn->close();
        ?>

        <!-- Add New Car Form -->
        <div id="add-car-form">
            <h1 class="title-design">Add a New Car</h1>
            <form method="POST" action="" enctype="multipart/form-data">
                <label class="text-design">Brand (znamka): <input type="text" name="znamka" required></label><br>
                <label class="text-design">Model: <input type="text" name="model" required></label><br>
                <label class="text-design">Year (letnik): <input type="number" name="letnik" required></label><br>
                <label class="text-design">Motor: <input type="text" name="motor" required></label><br>
                <label class="text-design">Fuel (gorivo): <input type="text" name="gorivo" required></label><br>
                <label class="text-design">Transmission (menjalnik): <input type="text" name="menjalnik" required></label><br>
                <label class="text-design">Kilometers (kilometri): <input type="number" name="kilometri" required></label><br>
                <label class="text-design">Price (cena): <input type="number" step="0.01" name="cena" required></label><br>
                <label class="text-design">Stock (zaloga): <input type="number" name="zaloga" required></label><br>
                <label class="text-design">Drive (pogon): <input type="text" name="pogon" required></label><br>
                <label class="text-design">Interior (notranjost): <input type="text" name="notranjost" required></label><br>
                <label class="text-design">Equipment (oprema): <input type="text" name="oprema" required></label><br>
                <label class="text-design">Condition (stanje): <input type="text" name="stanje" required></label><br>
                <label class="text-design">Supplier ID (dobavitelj_id): <input type="number" name="dobavitelj_id" required></label><br>
                <label class="text-design">Description (opis): <textarea oninput="autoResize(this)" rows="1" name="opis"></textarea></label><br>
                <label class="text-design">Image URL (slika): <input type="text" name="slika" required></label><br>
                <button type="submit" name="add_car" class="text-design button">Add Car</button>
            </form>
        </div>
    </section>
</div>

<script src="static/script/script.js"></script>
</body>
</html>
