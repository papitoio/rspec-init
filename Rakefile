

desc 'Executa os testes no firefox'
task :firefox do
    sh 'BROWSER=firefox rspec -fd --tag smoke'
end

desc 'Executa os testes no Google Chrome'
task :chrome do
    sh 'BROWSER=chrome rspec -fd --tag smoke'
end

desc 'Executa os testes em Headless'
task :headless do
    sh 'BROWSER=chrome_headless rspec -fd --tag smoke'
end