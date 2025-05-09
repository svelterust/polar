module.exports = {
  content: ["./js/**/*.js", "../lib/polar_web.ex", "../lib/polar_web/**/*.*ex"],
  theme: {
    extend: {
      colors: {
        brand: "#FD4F00",
      },
    },
  },
  plugins: [require("@tailwindcss/forms")],
};
