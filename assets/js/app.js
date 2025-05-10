import axios from "axios";
import { mount } from "svelte";
import { createInertiaApp } from "@inertiajs/svelte";

axios.defaults.xsrfHeaderName = "x-csrf-token";

createInertiaApp({
  resolve: async (name) => await import(`./pages/${name}.svelte`),
  setup({ App, el, props }) {
    mount(App, { target: el, props });
  },
});
