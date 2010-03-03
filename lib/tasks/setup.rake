namespace :app do
  desc "bomb and rebuild the playground"
  task :setup => %w(environment db:create db:migrate db:fixtures:load) do
    puts <<-EOS  
Welcome to acs_playground
=========================
INSPIRATION http://www.asciiartfarts.com/20100202.html
===========
  \|           -<_/                                      __ 
  \_>-           |\           __           .-.         / \\'
  (\      .-.    | \         \|\- _       c ,,)      _//    
  | \_   c ,,)   > /             \_ \__   (__,     _/ /     
   \   `-.\_/ -/  /                \   \- ' /`-._/   )      
    `-/          (                   -/           _/        
      (    / \    )                  (    / \    )          
       '-'    `-.a                    `@_/   `-.@           
        \       |                         \       |         
         |  ,  /\                          |  ,  /\         
         /`-._/  \                         /`-._/  \        
         |  _     \                        |  _     )       
        /  / \     |                      /  / \   /        
        | /   \    \                    / _/  /   /         
        )/     |   |                   //     |  /          
       (_/     |  /                   (/      | /           
               | \                            ||            
                \_)                           \) S-v        


SETUP
=====
  YOU NEED A MYSQL SERVER RUNNING ON LOCALHOST WITH ROOT USER NO PASSWORD.
  
  this script, `rake app:setup` just bombed, built, and populated yer mysql db with about a few hunder fixtures
  to use in your autocompleter using a dog data set of about 130 rows--use it as ammunittion in autocompleter
  proof concept.
    
EOS
  end
end
