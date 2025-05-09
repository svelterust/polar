import React from "react";

type Props = {
  items?: string[];
};

const Index = ({ items }: Props) => {
  return (
    <>
      <h1 className="text-3xl font-semibold">Check out these items:</h1>
      {items ? (
        <ul className="list-disc list-inside mt-4">
          {items.map((item, index) => (
            <li key={index}>{item}</li>
          ))}
        </ul>
      ) : (
        <p className="mt-4">Loading...</p>
      )}
    </>
  );
};

export default Index;
