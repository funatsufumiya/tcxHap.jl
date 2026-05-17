test_cases = [
  "hap_player_test.jl",
]

for case in test_cases
  include(case)
end

nothing