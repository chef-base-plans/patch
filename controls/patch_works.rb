title 'Tests to confirm patch works as expected'

plan_name = input('plan_name', value: 'patch')
plan_ident = "#{ENV['HAB_ORIGIN']}/#{plan_name}"

control 'core-plans-patch-works' do
  impact 1.0
  title 'Ensure patch works as expected'
  desc '
  '
  patch_path = command("hab pkg path #{plan_ident}")
  describe patch_path do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
  end
  
  patch_pkg_ident = ((patch_path.stdout.strip).match /(?<=pkgs\/)(.*)/)[1]
  describe command("DEBUG=true; hab pkg exec #{ patch_pkg_ident} patch --version") do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
    its('stdout') { should match /GNU patch 2.7.6/ }
    its('stderr') { should be_empty }
  end
end
