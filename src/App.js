import './styles/style.css';
import { useState, useRef, useEffect } from 'react';

function App() {
  const [position, setPosition] = useState({ x: 300, y: 225 }); // Center position initially
  const [isDragging, setIsDragging] = useState(false);
  const [dragOffset, setDragOffset] = useState({ x: 0, y: 0 });
  const buttonRef = useRef(null);

  const handleMouseDown = (e) => {
    e.preventDefault(); // Prevent text selection while dragging
    setIsDragging(true);
    const rect = buttonRef.current.getBoundingClientRect();
    setDragOffset({
      x: e.clientX - rect.left,
      y: e.clientY - rect.top
    });
  };

  const handleMouseMove = (e) => {
    if (!isDragging) return;
    
    const container = buttonRef.current.parentElement;
    const containerRect = container.getBoundingClientRect();
    
    const newX = e.clientX - containerRect.left - dragOffset.x;
    const newY = e.clientY - containerRect.top - dragOffset.y;
    
    // Keep button within container bounds
    const maxX = containerRect.width - buttonRef.current.offsetWidth;
    const maxY = containerRect.height - buttonRef.current.offsetHeight;
    
    setPosition({
      x: Math.max(0, Math.min(newX, maxX)),
      y: Math.max(0, Math.min(newY, maxY))
    });
  };

  const handleMouseUp = () => {
    setIsDragging(false);
  };

  useEffect(() => {
    if (isDragging) {
      document.addEventListener('mousemove', handleMouseMove);
      document.addEventListener('mouseup', handleMouseUp);
    }
    return () => {
      document.removeEventListener('mousemove', handleMouseMove);
      document.removeEventListener('mouseup', handleMouseUp);
    };
  }, [isDragging, dragOffset]);

  return (
    <div className="container">
      <img src="https://www.iclarified.com/images/news/97556/465566/465566.jpg" />

      <div 
        className="button"
        ref={buttonRef}
        onMouseDown={handleMouseDown}
        style={{
          left: `${position.x}px`,
          top: `${position.y}px`,
          position: 'absolute',
          userSelect: 'none'
        }}
      >
        <button>Button</button>
      </div>
    </div>
  );
}

export default App;
