using Lindenmayer
using LinearAlgebra, Statistics
using Distributions

plant1 = LSystem(
   Dict(
      "F" => "FF",
      "X" => "F−[[cX]+X]+F[+X]−X"
   ),
   "1X"
)




function gen_Ldict()
   p1, p2 = rand(["fX", "+X", "-X", "Fo", "Bq", "F--", "F[+X]"], 2)
   LSystem(
      Dict(
         "F" => "FX",
         "X" => "F−[$p1+X]+F[$p2]−X"
      ),
      "1X"
   )
end

params = Dict(
   "forward" => 12,
   "angle" => 30,
   "start_angle" => 3π / 2,
   "iters" => 3,
)

begin
   plant1 = gen_Ldict()
   draw_L_system(plant1, params, 1)
end

function draw_L_system(plant::LSystem, params, sample_no)
   drawLSystem(
      plant,
      forward=params["forward"],
      turn=params["angle"],
      iterations=params["iters"],
      # startingpen=(0, 0.8, 0.2),
      startingpen=(1, 1, 1),
      startingorientation=params["start_angle"],
      startingx=-50,
      startingy=100,
      filename="plots/img_$sample_no.png",
      showpreview=false)
end