    //===Tutorial Steps
    draw_set_colour(c_white);
    if (tut_step = 0)
    {
    str1 = "Use AD or the arrow keys to move"
    draw_text(0, 0, str1)
    if (keyboard_check_direct(vk_left) || keyboard_check_direct(ord("A"))) || (keyboard_check_direct(vk_right) || keyboard_check_direct(ord("D")))
        {
        string_delete(str1, 0, string_length(str1))
        tut_step += 1
        }
    }
    
   if (tut_step = 1)
    {
    str1 = "Press Spacebar to attack"
    draw_text(0, 0, str1)
    if (obj_player.state = st.attack) 
        {
        string_delete(str1, 0, string_length(str1))
        tut_step += 1
        }
    }

    if (tut_step = 2)
    {
    str1 = "Press LShift to jump"
    draw_text(0, 0, str1)
    if (obj_player.vsp != 0) 
        {
        string_delete(str1, 0, string_length(str1))
        tut_step += 1
        }
    }
    
    if (tut_step = 3)
    {
    str1 = "Press Ctrl to dodge"
    draw_text(0, 0, str1)
    if (obj_player.state = st.dodge) 
        {
        string_delete(str1, 0, string_length(str1))
        }
    }
    
    
