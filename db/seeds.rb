puts 'Gerando mouses...'

5.times do |i|
  Mouse.create(
    mouse_type: ["optico", "mecanico"].sample ,
    description: ["tipo 1","tipo2"].sample
    )
end

puts 'mouses gerados com sucesso!'