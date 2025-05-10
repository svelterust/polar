import axios from "axios";
import { mount, hydrate } from "svelte";
import { createInertiaApp } from "@inertiajs/svelte";

axios.defaults.xsrfHeaderName = "x-csrf-token";

createInertiaApp({
  resolve: async (name) => await import(`./pages/${name}.svelte`),
  setup({ App, el, props }) {
    if (el.dataset.serverRendered === "true") {
      hydrate(App, { target: el, props });
    } else {
      mount(App, { target: el, props });
    }
  },
});
