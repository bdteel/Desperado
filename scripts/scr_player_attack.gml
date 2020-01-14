        //===Movement
        if (jbuff > 0) jbuff--;
        vsp += grv;
        
        var move;
        move = -(keyboard_check_direct(vk_left) || keyboard_check_direct(ord("A"))) + (keyboard_check_direct(vk_right) || keyboard_check_direct(ord("D")));
        hsp += acc * move;
        
        //====Friction
        hsp = Approach(hsp,0,frc);
        
        //====Footstep
        if (stepcount > 12)
        {
            stepcount = 0;
            if (steppitch == 0.8) steppitch = 0.6 else steppitch = 0.8;
            audio_sound_pitch(snd_step,steppitch)
            audio_play_sound(snd_step,0,0);
        }
    
        //====Animate
        sprite_index = spr_attack;
        
        //====Hitbox
        if (image_index >= 1) && (image_index <= 3)
        {
            with (instance_create(x,y,obj_hitbox))
            {
                image_xscale = other.image_xscale;
                with (instance_place(x,y,par_enemy))
                {
                    if (hit == 0)
                    {
                        hit = 1;
                        vsp = -3;
                        
                        hsp = sign(x - other.x) * 4;
                        if ((x - other.x) != 0)
                        {
                            image_xscale = sign(hsp);
                        }
                        else { }
                    }
                }
            }
        }
        Player_MoveCollide();
