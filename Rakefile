# Copyright (c) 2023 kk
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

task default: %w[push]

task :push do
  sh 'git add .'
  sh "git commit -m 'Update #{Time.now.strftime('%Y-%m-%d %H:%M:%S')}.'"
  sh 'git push origin main'
end
