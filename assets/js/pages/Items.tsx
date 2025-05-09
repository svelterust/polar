import React from "react";
import { useForm } from "@inertiajs/react";

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
  // Form
  const { data, setData, post, processing, errors, reset } = useForm({
    title: "",
    description: "",
  });

  const handleSubmit = (event: React.FormEvent) => {
    event.preventDefault();
    post("/", { onSuccess: () => reset() });
  };

  return (
    <>
      <h1 className="text-3xl font-bold mb-6">Create Item</h1>
      <div className="mb-8 max-w-screen-sm">
        <form onSubmit={handleSubmit}>
          <div className="form-control mb-4">
            <span className="label-text">Title</span>
            <input
              type="text"
              id="title"
              value={data.title}
              onChange={(e) => setData("title", e.target.value)}
              className="input input-bordered w-full mt-2"
            />
            {errors.title && (
              <div className="text-error text-sm mt-1">{errors.title}</div>
            )}
          </div>

          <div className="form-control mb-4">
            <span className="label-text mb-2">Description</span>
            <textarea
              id="description"
              value={data.description}
              onChange={(e) => setData("description", e.target.value)}
              className="textarea textarea-bordered w-full mt-2"
              rows={4}
            />
            {errors.description && (
              <div className="text-error text-sm mt-1">
                {errors.description}
              </div>
            )}
          </div>

          <button
            type="submit"
            disabled={processing}
            className="btn btn-primary"
          >
            {processing ? (
              <span className="loading loading-spinner"></span>
            ) : null}
            {processing ? "Submitting..." : "Create Item"}
          </button>
        </form>
      </div>

      <h2 className="text-2xl font-bold mb-2">Items</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {items.length > 0 ? (
          items.map((item, index) => (
            <div
              key={index}
              className="card border border-slate-300 transition duration-200"
            >
              <div className="card-body">
                <h2 className="card-title">{item.title}</h2>
                <p>{item.description}</p>
                <div className="card-actions">
                  <div className="badge badge-primary">
                    {formatDate(item.inserted_at)}
                  </div>
                </div>
              </div>
            </div>
          ))
        ) : (
          <div className="col-span-full alert alert-info">
            <span className="i-lucide-info shrink-0 w-6 h-6"></span>
            <span>No items available.</span>
          </div>
        )}
      </div>
    </>
  );
};

export default Index;
