    //====Dodge
    sprite_index = spr_dodge;
    
    if (image_index >= 0) && (image_index <= 3)
    {
        Player_MoveCollide();
        hsp = 4 * image_xscale;
    }
    
    if (image_index = 4) 
    {
        state = st.normal;
        var move;
        move = -(keyboard_check_direct(vk_left) || keyboard_check_direct(ord("A"))) + (keyboard_check_direct(vk_right) || keyboard_check_direct(ord("D")));
        hsp += acc * move;
    }
        
