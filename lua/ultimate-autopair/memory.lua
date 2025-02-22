local M={}
M.extensions={}
M.oextensions={}
M.filters={}
M.mem={}
M.mapped={}
function M.load_extension(name)
    return require('ultimate_autopair_extensions.'..name)
end
function M._filters_add_defaults(filters)
    local conf=require('ultimate-autopair.config').conf
    if conf._default_beg_filter then filters=vim.list_extend({{call=conf._default_beg_filter}},filters) end
    filters=vim.list_extend(conf._prefilters or {},filters)
    filters=vim.list_extend(filters,conf._postfilters or {})
    if conf._default_end_filter then filters=vim.list_extend(filters,{{call=conf._default_end_filter}}) end
    return filters
end
function M.gen_filters()
    local filters={}
    for _,name in ipairs(M.oextensions) do
        local extension=M.extensions[name]
        if extension.call then
            filters[#filters+1]={call=extension.call,conf=extension.conf,name=name}
        end
    end
    M.filters=M._filters_add_defaults(filters)
end
function M.addpair(key,pair,paire,type,keyconf)
    if not M.mem[key] then
        M.mem[key]={pair=pair,paire=paire,type=type,keyconf={}}
    end
    for i,opt in pairs(keyconf) do
        if _G.type(opt)=='table' then
            if vim.tbl_islist(opt) then
                M.mem[key].keyconf[i]=vim.list_extend(M.mem[key].keyconf[i] or {},opt)
            else
                M.mem[key].keyconf[i]=vim.tbl_deep_extend('force',M.mem[key].keyconf[i] or {},opt)
            end
        else
            M.mem[key].keyconf[i]=opt
        end
    end

end
function M.ispair(prev_char,next_char)
    local prev_pair=M.mem[prev_char]
    local next_pair=M.mem[next_char]
    if prev_pair and next_pair then
        if prev_pair.type==2 or next_pair.type==1 then
            return
        end
        return prev_pair.pair==next_pair.pair and prev_pair.paire==next_pair.paire
    end
end
function M.isstart(line,col)
    local open_pair=require'ultimate-autopair.utils.open_pair'
    local char=line:sub(col,col)
    local pair=M.mem[char]
    if not pair then
        return false
    end
    if pair.type==1 then
        return true
    elseif pair.type==2 then
        return false
    end
    return not open_pair.open_pair_ambigous_only_before(char,line,col)
end
function M.isend(line,col)
    local pair=M.mem[line:sub(col,col)]
    if not pair then
        return false
    end
    return not M.isstart(line,col)
end
return M
