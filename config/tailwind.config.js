const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'custom-primary': '#F7AF3C',
        'beige': '#F5F5DC'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ],
  safelist: [
    // {
    //   pattern:
    //     /^(bg-(?:slate|gray|zinc|neutral|stone|red|orange|amber|yellow|lime|green|emerald|teal|cyan|sky|blue|indigo|violet|purple|fuchsia|pink|rose)-(?:50|100|200|300|400|500|600|700|800|900|950))$/,
    //   variants: ["hover", "ui-selected"],
    // },
    // {
    //   pattern:
    //     /^(text-(?:slate|gray|zinc|neutral|stone|red|orange|amber|yellow|lime|green|emerald|teal|cyan|sky|blue|indigo|violet|purple|fuchsia|pink|rose)-(?:50|100|200|300|400|500|600|700|800|900|950))$/,
    //   variants: ["hover", "ui-selected"],
    // },
    // {
    //   pattern:
    //     /^(text-(?:xs|sm|base|lg|xl|2xl|3xl|4xl|5xl|6xl|7xl|8xl|9xl))$/,
    //   variants: ["hover", "ui-selected"],
    // },
    // {
    //   pattern:
    //     /^(border-(?:slate|gray|zinc|neutral|stone|red|orange|amber|yellow|lime|green|emerald|teal|cyan|sky|blue|indigo|violet|purple|fuchsia|pink|rose)-(?:50|100|200|300|400|500|600|700|800|900|950))$/,
    //   variants: ["hover", "ui-selected"],
    // },
    // {
    //   pattern:
    //     /^(ring-(?:slate|gray|zinc|neutral|stone|red|orange|amber|yellow|lime|green|emerald|teal|cyan|sky|blue|indigo|violet|purple|fuchsia|pink|rose)-(?:50|100|200|300|400|500|600|700|800|900|950))$/,
    // },
    // {
    //   pattern:
    //     /^(stroke-(?:slate|gray|zinc|neutral|stone|red|orange|amber|yellow|lime|green|emerald|teal|cyan|sky|blue|indigo|violet|purple|fuchsia|pink|rose)-(?:50|100|200|300|400|500|600|700|800|900|950))$/,
    // },
    // {
    //   pattern:
    //     /^(fill-(?:slate|gray|zinc|neutral|stone|red|orange|amber|yellow|lime|green|emerald|teal|cyan|sky|blue|indigo|violet|purple|fuchsia|pink|rose)-(?:50|100|200|300|400|500|600|700|800|900|950))$/,
    // },
    // {
    //   pattern:
    //     /^(h-(?:1|2|3|4|5|6|7|8|9|10|11|12|14|16|20|24|28|32|36|40|44|48|52|56|60|64|72|80|96|auto|full|screen))$/,
    // },
    // 'h-1/2',
    // 'h-1/3',
    // 'h-2/3',
    // 'h-1/4',
    // 'h-2/4',
    // 'h-3/4',
    // 'h-1/5',
    // 'h-2/5',
    // 'h-3/5',
    // 'h-4/5',
    // 'h-1/6',
    // 'h-2/6',
    // 'h-3/6',
    // 'h-4/6',
    // 'h-5/6',
    // {
    //   pattern:
    //     /^(w-(?:1|2|3|4|5|6|7|8|9|10|11|12|14|16|20|24|28|32|36|40|44|48|52|56|60|64|72|80|96|auto|full|screen))$/,
    // },
    // 'w-1/2',
    // 'w-1/3',
    // 'w-2/3',
    // 'w-1/4',
    // 'w-2/4',
    // 'w-3/4',
    // 'w-1/5',
    // 'w-2/5',
    // 'w-3/5',
    // 'w-4/5',
    // 'w-1/6',
    // 'w-2/6',
    // 'w-3/6',
    // 'w-4/6',
    // 'w-5/6',
    // 'w-1/12',
    // 'w-2/12',
    // 'w-3/12',
    // 'w-4/12',
    // 'w-5/12',
    // 'w-6/12',
    // 'w-7/12',
    // 'w-8/12',
    // 'w-9/12',
    // 'w-10/12',
    // 'w-11/12',
    // {
    //   pattern:
    //     /^(p-(?:1|1.5|2|2.5|3|3.5|4|5|6|7|8|9|10|11|12|14|16|20|24|28|32|36|40|44|48|52|56|60|64|72|80|96))$/,
    // },
    // {
    //   pattern:
    //     /^(pt-(?:1|2|3|4|5|6|7|8|9|10|11|12|14|16|20|24|28|32|36|40|44|48|52|56|60|64|72|80|96|auto|full|screen))$/,
    // },
    // {
    //   pattern:
    //     /^(pr-(?:1|2|3|4|5|6|7|8|9|10|11|12|14|16|20|24|28|32|36|40|44|48|52|56|60|64|72|80|96|auto|full|screen))$/,
    // },
    // {
    //   pattern:
    //     /^(pb-(?:1|2|3|4|5|6|7|8|9|10|11|12|14|16|20|24|28|32|36|40|44|48|52|56|60|64|72|80|96|auto|full|screen))$/,
    // },
    // {
    //   pattern:
    //     /^(pl-(?:1|2|3|4|5|6|7|8|9|10|11|12|14|16|20|24|28|32|36|40|44|48|52|56|60|64|72|80|96|auto|full|screen))$/,
    // },
    // {
    //   pattern:
    //     /^(px-(?:1|2|3|4|5|6|7|8|9|10|11|12|14|16|20|24|28|32|36|40|44|48|52|56|60|64|72|80|96|auto|full|screen))$/,
    // },
    // {
    //   pattern:
    //     /^(py-(?:1|2|3|4|5|6|7|8|9|10|11|12|14|16|20|24|28|32|36|40|44|48|52|56|60|64|72|80|96|auto|full|screen))$/,
    // },

    // {
    //   pattern:
    //     /^(m-(?:1|1.5|2|2.5|3|3.5|4|5|6|7|8|9|10|11|12|14|16|20|24|28|32|36|40|44|48|52|56|60|64|72|80|96))$/,
    // },
    // {
    //   pattern:
    //     /^(mt-(?:1|2|3|4|5|6|7|8|9|10|11|12|14|16|20|24|28|32|36|40|44|48|52|56|60|64|72|80|96|auto|full|screen))$/,
    // },
    // {
    //   pattern:
    //     /^(mr-(?:1|2|3|4|5|6|7|8|9|10|11|12|14|16|20|24|28|32|36|40|44|48|52|56|60|64|72|80|96|auto|full|screen))$/,
    // },
    // {
    //   pattern:
    //     /^(mb-(?:1|2|3|4|5|6|7|8|9|10|11|12|14|16|20|24|28|32|36|40|44|48|52|56|60|64|72|80|96|auto|full|screen))$/,
    // },
    // {
    //   pattern:
    //     /^(ml-(?:1|2|3|4|5|6|7|8|9|10|11|12|14|16|20|24|28|32|36|40|44|48|52|56|60|64|72|80|96|auto|full|screen))$/,
    // },
  ],
}
