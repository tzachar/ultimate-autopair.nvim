# CR
+ [x] support
+ [x] auto add newline and tab `{|} > CR > {\n\t|\n}`
+ [x] respect the indentation level
+ [x] auto add pair `{| > CR > {\n|\n}`
+ [x] make falback behavior changable
+ [x] auto add multicharacter (markdown code block) `'''text|''' > CR > '''text\n\t|\n'''`)
+ [x] auto add multicharacter pairs `then| > CR > then\n|\nend`
+ [x] autocomplete integration
+ [x] make key spesific fallback
+ [x] auto add ; att the end of } in c when newline
+ [x] auto add pairs `{|}; > CR > {\n|\n};`
+ [x] auto add pairs `{|} foo > CR > {\n|\n} foo`
+ [x] auto add pairs `({|}) > CR > ({\n|\n})`
+ [x] make it have the ability to use extensions
+ [x] auto add even if text `{abc|} > CR > {abc\n|\n}`
+ [x] dont add multicharacter pairs `then|\nend > CR > then\n|\nend`
+ [x] auto add even if text `(|abc) > CR > (\n|abc\n)`
+ [ ] auto add pairs `({| > CR > ({\n|\n})`
+ [ ] splitjoin plugin integration
+ [ ] multicharacter pair not in string/other node
+ [ ] make map use filtering pair extensions
# BS
+ [x] suport
+ [x] remove the pair `[|] > BS > |`
+ [x] remove the pair when pair filled `[|abc] > BS > |abc`
+ [x] remove the pair when pair empty `()| > BS > |`
+ [x] dont remove pair when cause not balance `[[|] > BS > [|]`
+ [x] make falback behavior changable
+ [x] remove the space in the pair `[ | ] > BS > [|]`
+ [x] remove the pair when multicharacter pair `/*|*/ > BS > |`
+ [x] filter string `'"'"|" > BS > '"'|`
+ [x] make key spesific fallback
+ [x] make it have the ability to use extensions
+ [x] remove the pair when multicharacter pair empty `/**/| > BS > |`
+ [x] remove the both newline in multiline pair `[\n|\n] > BS > [|]`
+ [x] remove the pair when pair with space `[ ]| > BS > |`
+ [ ] remove the pair when multicharacter pair filled `if bool then |code end > BS > |code`
+ [ ] remove the unbalanced space in the pair `[  | ] > BS > [ | ]`
+ [ ] remove the unbalanced space in the pair `[ |  ] > BS > [ | ]`
+ [ ] remove the unbalanced space in the pair `[  |] > BS > [|]`
+ [ ] remove the space when remove pair `[| text ] > BS > |text`
+ [ ] remove the ambiguous pair when filled `"|abc" > BS > |abc`
+ [ ] make map use filtering pair extensions
# other mappings
+ [x] space `[|] > SP > [ | ]`
+ [x] smart space `[|text] > SP > [ |text ]`
+ [x] normal fastwarp `{|}[] > <A-e> > {[]|}`
+ [x] normal fastwarp `{}|foo > <A-e> > {foo|}`
+ [x] normal fastwarp `{foo|},bar > <A-e> > {foo,bar|}`
+ [x] normal fastwarp `{foo|}, > <A-e> > {foo,|}`
+ [x] normal fastwarp `{foo|},(bar) > <A-e> > {foo,(bar)|}`
+ [x] normal fastwarp `{(|),},bar > <A-e> > {(,|)},bar`
+ [x] make key spesific fallback
+ [x] makdown don't add space `+ [|]` > `+ [ |]`
+ [x] fastwarp end  `<A-$>`
+ [x] make it have the ability to use extensions
+ [x] fastwarp WORD `<A-E>`
+ [x] norma fastwarp multi line
+ [x] reverse fastwarp (+multiline)
+ [x] smart fastwarp end `(|)foo,bar,` > `<A-$>` > `(foo,bar|),`
+ [ ] one char fastwarp `(foo|),, > <A-L> > (foo,|),`
+ [ ] hop style fastwarp
+ [ ] `[{"| > <A-k> > [{""}]`
+ [ ] fastwarp for starting pair/ambiguous pair `|(foo,bar)` > `foo,|(bar)`
+ [ ] make maps use filtering pair extensions
# filters
+ [x] only filter inside or outside of string
+ [x] user defined rules
+ [x] filetype
+ [x] multiline mode with the indentation determening the block size
+ [x] disable for surtent cmdlinetypes
+ [x] treesitter integration for special blocks (aka strings)
+ [x] only filter inside or outside of comments and other user defined treesitter nodes
+ [x] make block filtering for inside/outside otpional `b|#a` > `b|\1` and `b#a|` > `b#a|` and not `\1#a|`
+ [ ] user defined multiline as one (maybe using treesitter)
# inserting
+ [x] dont add pair `'` if previous is alphanumeric
+ [x] dont complete when previous is \ in string? `\| > [ > \[`
+ [x] `'a|b' > ' > 'a'|'b'`
+ [x] `f > ' > f''`
+ [x] `[[|] > ] > [[]|] and not [[]|`
+ [x] dont add pair if next is alphanumeric
+ [x] add the parens att end when logical `|"a" > [ > ["a"|]`
+ [x] auto escape extend in string?`'\|a' > ' > '\'|\'a'`
+ [x] dont add pair `'` in lisp
+ [x] lisp smart pair `"|" > ' > "'|'"`
+ [x] quick hop end `[{|}] > ] > [{}]|`
+ [x] auto goto end if only space or newline `[text|  ] > ] > [text  ]|`
+ [x] smart add `()|) > ) ())|)`
+ [x] auto goto end `[te|xt] > ] > [text]|`
+ [ ] auto skip multicharacter pair `/*|*/ > * > /**/|`
+ [ ] auto goto end if only space and remove `[text|  ] > ] > [text]|`
+ [ ] open multicharacter-pair detector
+ [ ] auto goto end if only newline and remove `[\n\t|\n] > ] > [\n]|`
+ [ ] add the parens att end when logical `|{a} > [ > [|{a}]`
# pairs
+ [x] multicharacter pair `py ''' and md ````
+ [x] comment pairs `/*|*/`
+ [x] nonsymetrical comment pairs `<!--|-->`
+ [x] multicharacter pair with word delimiter `aAND ~= AND`
+ [x] other keywords `if ... end`?
+ [ ] integration with (windwp/nvim-ts-autotag) to suport html tags
+ [ ] regex/wildcard multicharacter pair suport
+ [ ] with random text inbetween `if TEXT ... end`?
+ [ ] possibility of html tag suport
# other
+ [x] command-line integration
+ [x] make everything optional
+ [x] fix bug which happens when nvim is booted up
+ [x] dot repeat
+ [x] abbreviation suport
+ [x] map repeating `vim.v.count` (maybe by making mappings {expr=true})
+ [x] replace mode integration
+ [x] make it so that for type-2 pair map the begining and not the end `bar` > `map b` and not `map r`
+ [x] testing
+ [ ] better string filtering `'foo'|` > `'\1'|` and not `\1|`
+ [ ] terminal mode integration
