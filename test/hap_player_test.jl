using Test
using tcxHap; hap = tcxHap

@testset "HapPlayer Test" begin

    p = HapPlayer()

    @test isPlaying(p) == false

end