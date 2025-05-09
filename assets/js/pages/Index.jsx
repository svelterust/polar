import React from "react";

const Index = ({ items }) => {
  return (
    <>
      <div>
        <p>Check out these items:</p>
        <ul className="list-disc list-inside mt-2">
          {items.map((item, index) => (
            <li key={index}>{item}</li>
          ))}
        </ul>
      </div>
    </>
  );
};

export default Index;
