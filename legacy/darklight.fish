function set_light
    # Colorscheme: ayu Light
    set -U fish_color_normal 575F66
    set -U fish_color_command 55B4D4
    set -U fish_color_quote 86B300
    set -U fish_color_redirection A37ACC
    set -U fish_color_end ED9366
    set -U fish_color_error F51818
    set -U fish_color_param 575F66
    set -U fish_color_comment ABB0B6
    set -U fish_color_match F07171
    set -U fish_color_selection --background=FF9940
    set -U fish_color_search_match --background=FF9940
    set -U fish_color_history_current --bold
    set -U fish_color_operator FF9940
    set -U fish_color_escape 4CBF99
    set -U fish_color_cwd 399EE6
    set -U fish_color_cwd_root red
    set -U fish_color_valid_path --underline
    set -U fish_color_autosuggestion 8A9199
    set -U fish_color_user brgreen
    set -U fish_color_host normal
    set -U fish_color_cancel --reverse
    set -U fish_pager_color_prefix normal --bold --underline
    set -U fish_pager_color_progress brwhite --background=cyan
    set -U fish_pager_color_completion normal
    set -U fish_pager_color_description B3A06D
    set -U fish_pager_color_selected_background --background=878787
    set -U fish_color_option
    set -U fish_pager_color_secondary_description
    set -U fish_color_host_remote
    set -U fish_pager_color_selected_description
    set -U fish_pager_color_selected_prefix
    set -U fish_color_keyword
    set -U fish_pager_color_secondary_prefix
    set -U fish_pager_color_secondary_background
    set -U fish_pager_color_selected_completion
    set -U fish_pager_color_background
    set -U fish_pager_color_secondary_completion
end

function set_dark
    # Colorscheme: Nord
    set -U fish_color_normal normal
    set -U fish_color_command 88c0d0
    set -U fish_color_quote a3be8c
    set -U fish_color_redirection b48ead --bold
    set -U fish_color_end 81a1c1
    set -U fish_color_error bf616a
    set -U fish_color_param d8dee9
    set -U fish_color_comment 4c566a --italics
    set -U fish_color_match --background=brblue
    set -U fish_color_selection d8dee9 --bold --background=434c5e
    set -U fish_color_search_match --bold --background=434c5e
    set -U fish_color_history_current e5e9f0 --bold
    set -U fish_color_operator 81a1c1
    set -U fish_color_escape ebcb8b
    set -U fish_color_cwd 5e81ac
    set -U fish_color_cwd_root bf616a
    set -U fish_color_valid_path --underline
    set -U fish_color_autosuggestion 4c566a
    set -U fish_color_user a3be8c
    set -U fish_color_host a3be8c
    set -U fish_color_cancel --reverse
    set -U fish_pager_color_prefix normal --bold --underline
    set -U fish_pager_color_progress 3b4252 --background=d08770
    set -U fish_pager_color_completion e5e9f0
    set -U fish_pager_color_description ebcb8b --italics
    set -U fish_pager_color_selected_background --background=434c5e
    set -U fish_color_option
    set -U fish_pager_color_secondary_description
    set -U fish_color_host_remote
    set -U fish_pager_color_selected_description
    set -U fish_pager_color_selected_prefix
    set -U fish_color_keyword
    set -U fish_pager_color_secondary_prefix
    set -U fish_pager_color_secondary_background
    set -U fish_pager_color_selected_completion
    set -U fish_pager_color_background
    set -U fish_pager_color_secondary_completion
end

function switch_colorscheme
    set appearance (darklight)
    if test "$appearance" = Dark
        # fish_config theme save Nord
        set_dark
    else if test "$appearance" = Light
        # fish_config theme save "ayu Light"
        set_light
    end
end
switch_colorscheme

# function auto_update_colorscheme
#     while true
#         switch_colorscheme
#         sleep 30
#     end
# end
# auto_update_colorscheme &
