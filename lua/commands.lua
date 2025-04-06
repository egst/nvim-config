require 'helpers'

-- TODO: Solve the issues with php8.2
cmd('Phpv set splitbelow | vnew | read !php8.3 #')
--cmd('Php set splitbelow | new | read !IW_NICK=development IW_STAGE=local php8.3 -d app_environment=development #')
cmd('Php set splitbelow | new | read !php8.3 -d app_environment=development #')

cmd([[Test execute 'set splitbelow | new | terminal vendor/bin/phpunit ' . expand('%:p') | echo "Done."]])
cmd([[TestPph execute 'set splitbelow | new | terminal devops/bin/phpunit ' . expand('%:p') | echo "Done."]])

cmd('Display !display %')
cmd('D Display')
