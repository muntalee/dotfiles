if type -q nvim
    abbr --add -g vim 'nvim'
end

if type -q eza
    abbr --add -g ls 'eza -a'
    abbr --add -g ll 'eza -lag --header'
end

if type -q bat
    abbr --add -g cat 'bat'
end

if type -q trash
    abbr --add -g rm 'trash'
end
