
        //====Tick
        if (jbuff > 0) jbuff--;
        vsp += grv;
        
        //====Ground Check
        if (place_meeting(x,y+1,par_wall)) 
        {
            if (jbuff == 0)
            {
                //Just Landed
                audio_sound_pitch(snd_step,0.4);
                audio_play_sound(snd_step,0,0);
            }
            jbuff = 4;
        }
        
        //====Get Inputs
        var move;
        move = -(keyboard_check_direct(vk_left) || keyboard_check_direct(ord("A"))) + (keyboard_check_direct(vk_right) || keyboard_check_direct(ord("D")));
        hsp += acc * move;
        
        
        if (keyboard_check_pressed(vk_space))
            {
                state = st.attack;
                image_index = 0;
                sprite_index = spr_attack;
                
               
            }
        if (keyboard_check_pressed(vk_control))
            {
                repeat(choose(2,3)) instance_create(x,bbox_bottom,obj_dust);
                state = st.dodge;
            }
        if (jbuff > 0) 
        {
            if (keyboard_check_pressed(vk_shift))
            {
                vsp = jmp;
                jbuff = 0;
                repeat(choose(2,3)) instance_create(x,bbox_bottom,obj_dust);
                audio_sound_pitch(snd_step,1.2)
                audio_play_sound(snd_step,0,0);
            }
            
        }
        else
        {
            //Air inputs
        }
        
        //====Friction
        if (move == 0) hsp = Approach(hsp,0,frc);

        Player_MoveCollide();
        
        //====Animate
        if (sign(hsp_final) != 0) image_xscale = sign(hsp_final);
        if (abs(hsp_final) > 0) 
        {
            sprite_index = spr_hw; 
            stepcount++;
        }
        else 
        {
            sprite_index = spr_h;
            stepcount = 0;
        }
        if (jbuff == 0)
        {
            if (vsp_final < 0) sprite_index = spr_hj; else sprite_index = spr_hf;
            stepcount = 0;
        }
        
        //====Footstep
        if (stepcount > 12)
        {
            stepcount = 0;
            if (steppitch == 0.8) steppitch = 0.6 else steppitch = 0.8;
            audio_sound_pitch(snd_step,steppitch)
            audio_play_sound(snd_step,0,0);
        }
        

