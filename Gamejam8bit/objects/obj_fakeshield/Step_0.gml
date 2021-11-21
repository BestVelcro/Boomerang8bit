
// Apply gravity
if !place_meeting (x, y+1, obj_collisionground)
    {
        speed_v = speed_v + game_gravity ;
    }

// Check if there is a collsiion
scr_collision () ;
