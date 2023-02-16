local utils=require'ultimate-autopair.utils.utils'
local M={}
function M.default_end_filter(o,_,mem)
    if not mem[o.key] then
        return 2
    end
    local add_pair=require'ultimate-autopair.utils.add_pair'
    return add_pair.pair(o.pair,o.paire,o.line,o.col,o.type)
end
function M.default_beg_filter(o,_,mem)
    o.extra={}
    o.keyconf={}
    if mem[o.key] then
        o.pair=mem[o.key].pair
        o.paire=mem[o.key].paire
        o.type=mem[o.key].type
        o.keyconf=mem[o.key].keyconf
    end
    o.line=utils.getline()
    o.wline=utils.getline()
    o.col=utils.getcol()
    o.wcol=utils.getcol()
    o.linenr=utils.getlinenr()
    o.cmdmode=utils.incmd()
    o.ext=require'ultimate-autopair.memory'.extensions
end
M.default_config={
    mapopt={noremap=true},
    cmap=true,
    bs={
        enable=true,
        overjump=true,
        space=true,
        multichar=true,
        fallback=nil,
    },
    cr={
        enable=true,
        autoclose=false,
        multichar={
            markdown={{'```','```',pair=true,noalpha=true,next=true}},
            lua={{'then','end'},{'do','end'}},
        },
        addsemi={'c','cpp','rust'},
        fallback=nil,
    },
    space={
        enable=true,
        fallback=nil,
    },
    fastwarp={
        enable=true,
        map='<A-e>',
        Wmap='<A-E>',
        cmap='<A-e>',
        Wcmap='<A-E>',
        fallback=nil,
    },
    fastend={
        enable=true,
        map='<A-$>',
        cmap='<A-$>',
        fallback=nil,
    },
    _default_beg_filter=M.default_beg_filter,
    _default_end_filter=M.default_end_filter,
    extensions={
        {'cmdtype',{'/','?','@'}},
        --'indentblock',
        'multichar',
        'string',
        {'treenode',{inside={'comment'}}},
        'escape',
        'rules',
        'filetype',
        {'alpha',{before={"'"}}},
        {'suround',{'"',"'"}},
        {'fly',{')','}',']',' '}},
    },
    {'[',']'},
    {'(',')'},
    {'{','}'},
    {'"','"'},
    {"'","'",rules={{'when',{'option','lisp'},{'instring'}}}},
    {'`','`'},
    rules={
        {[[\']],[[\']],rules={{'not',{'or',{'next',"'"},{'previous','\\',2}}}}},
        {[[\"]],[[\"]],rules={{'not',{'or',{'next','"'},{'previous','\\',2}}}}},
    },
    ft={
        markdown={
            {'```','```'},
            {'<!--','-->'},
        },
        css={{'<!--','-->'}},
        c={{'/*','*/'}},
        cpp={{'/*','*/'}},
        cs={{'/*','*/'}},
        go={{'/*','*/'}},
        java={{'/*','*/'}},
        javascript={{'/*','*/'}},
        jsonc={{'/*','*/'}},
        rust={{'/*','*/'}},
        typescript={{'/*','*/'}},
        python={
            {'"""','"""'},
            {"'''","'''"},
        },
    },
}
return M
