///@func approach
///@param from
///@param to
///@param amount
//Approach(a, b, amount)
// Moves "a" towards "b" by "amount" and returns the result
// Nice bcause it will not overshoot "b", and works in both directions
// Examples:
//      speed = Approach(speed, max_speed, acceleration);
//      hp = Approach(hp, 0, damage_amount);
//      hp = Approach(hp, max_hp, heal_amount);
//      x = Approach(x, target_x, move_speed);
//      y = Approach(y, target_y, move_speed);
 
var a = argument0;
var b = argument1;
var amt = argument2;
 
if (a < b)
{
    a += amt;
    if (a > b)
        return b;
}
else
{
    a -= amt;
    if (a < b)
        return b;
}
return a;

