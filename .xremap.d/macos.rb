%w[a z x c v w t].each do |key|
  remap "Super-#{key}", to: "C-#{key}"
end

window class_only: 'google-chrome' do
  %w[f l].each do |key|
    remap "Super-#{key}", to: "C-#{key}"
  end
end

window class_only: 'xfce4-terminal' do
  remap "Super-c", to: "C-Shift-c"
  remap "Super-v", to: "C-Shift-v"
end
