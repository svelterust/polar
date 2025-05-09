import React from "react";

type Item = {
  title: string;
  description: string;
  inserted_at: string;
};

type Props = {
  items: Item[];
};

function formatDate(dateString: string) {
  const date = new Date(dateString);
  return date.toLocaleDateString("en-US", {
    year: "numeric",
    month: "long",
    day: "numeric",
  });
}

const Index = ({ items }: Props) => {
  return (
    <>
      <h1 className="text-3xl font-bold">Items</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 mt-6">
        {items.length > 0 ? (
          items.map((item, index) => (
            <div
              key={index}
              className="card shadow-md hover:shadow-lg transition duration-200"
            >
              <div className="card-body">
                <h2 className="card-title">{item.title}</h2>
                <p>{item.description}</p>
                <p className="text-sm opacity-70">
                  {formatDate(item.inserted_at)}
                </p>
              </div>
            </div>
          ))
        ) : (
          <div className="col-span-full alert alert-info">
            No items available.
          </div>
        )}
      </div>
    </>
  );
};

export default Index;
