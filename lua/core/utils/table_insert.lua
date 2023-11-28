return function(target, ...)
    local args = { ... }
    for i = 1, #args do
        target[#target + 1] = args[i]
    end
    return target
end
