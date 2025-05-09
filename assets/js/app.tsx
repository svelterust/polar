import React from "react";
import axios from "axios";

import { createInertiaApp } from "@inertiajs/react";
import { hydrateRoot } from "react-dom/client";

axios.defaults.xsrfHeaderName = "x-csrf-token";

createInertiaApp({
  progress: false,
  title: (title) => (title ? `${title} - Polar` : "Polar"),
  resolve: async (name) => {
    return await import(`./pages/${name}.tsx`);
  },
  setup({ App, el, props }) {
    hydrateRoot(el, <App {...props} />);
  },
});
