# A Forgotten Journal
Pico8 - Visual Novel Test

This program is a test to help better my understanding of nested tables, ensuring that I can properly work with stored information without needlessly overwriting it, and work under limiting circumstances to promote efficiency and cleaner code.

There are two major constaints with pico-8 that are worth acknowledging. The first is that only 8192 tokens may be created. For this purpose, variables, numbers, strings, and mathematical expressions are considered tokens. Thus, something such as value = 4.1 would be three tokens, and value[math]=4 would be five tokens. Thus, being effecient with my variables is heavily prioritized to ensure that I'm not needlessly making variables.

The other major constraint are characters. Only 65,535 characters are allowed within pico8, including comments and excess white space. As this is a visual novel at heart, I can't afford to keep my comments with my code, due to the space it takes. As such, I've elected to put them in the wiki, under "program comments" to better place my thoughts within them and to increase code readability.

While I certainly could have chosen a better medium than pico8 with less roadblocks and restrictions, I believe that restrictions themselves help the flow of creativity and unique workarounds. With that, I truly hope you enjoy reading "A Forgotten Journal".

- Neo
