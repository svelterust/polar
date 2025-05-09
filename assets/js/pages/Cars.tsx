import React from "react";
import { Link } from "@inertiajs/react";

const Cars = () => {
  return (
    <>
      <h1 className="text-3xl font-semibold">Cars</h1>
      <Link className="btn mt-4" href="/">
        Go back
      </Link>
    </>
  );
};

export default Cars;
