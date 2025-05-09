import React from "react";

type Props = {
  items: string[];
};

const Index = ({ items }: Props) => {
  return (
    <>
      <h1 className="text-3xl font-semibold">Check out these items:</h1>
      <ul className="list-disc list-inside mt-4">
        {items.map((item, index) => (
          <li key={index}>{item}</li>
        ))}
      </ul>
    </>
  );
};

export default Index;
