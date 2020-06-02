title 'Tests to confirm patch exists'

plan_name = input('plan_name', value: 'patch')
plan_ident = "#{ENV['HAB_ORIGIN']}/#{plan_name}"
patch_relative_path = input('command_path', value: '/bin/patch')
patch_installation_directory = command("hab pkg path #{plan_ident}")
patch_full_path = patch_installation_directory.stdout.strip + "#{ patch_relative_path}"
 
control 'core-plans-patch-exists' do
  impact 1.0
  title 'Ensure patch exists'
  desc '
  '
   describe file(patch_full_path) do
    it { should exist }
  end
end
