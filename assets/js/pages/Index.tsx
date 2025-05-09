import React from "react";
import { useState } from "react";

type Props = {
  items: string[];
};

const Index = ({ items }: Props) => {
  // Counter
  const [count, setCount] = useState(0);

  return (
    <>
      <h1 className="text-3xl font-semibold">Check out these items:</h1>
      <div className="flex items-center gap-4">
        <button className="btn mt-2" onClick={() => setCount(count + 1)}>
          Counter: {count}
        </button>
      </div>
      <ul className="list-disc list-inside mt-2">
        {items.map((item, index) => (
          <li key={index}>{item}</li>
        ))}
      </ul>
    </>
  );
};

export default Index;
