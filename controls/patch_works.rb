title 'Tests to confirm patch works as expected'

plan_origin = ENV['HAB_ORIGIN']
plan_name = input('plan_name', value: 'patch')

control 'core-plans-patch-works' do
  impact 1.0
  title 'Ensure patch works as expected'
  desc '
  Verify patch by ensuring (1) its installation directory exists and (2) that
  it returns the expected version
  '
  
  plan_installation_directory = command("hab pkg path #{plan_origin}/#{plan_name}")
  describe plan_installation_directory do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
  end
  
  plan_pkg_ident = ((plan_installation_directory.stdout.strip).match /(?<=pkgs\/)(.*)/)[1]
  plan_pkg_version = (plan_pkg_ident.match /^#{plan_origin}\/#{plan_name}\/(?<version>.*)\//)[:version]
  describe command("DEBUG=true; hab pkg exec #{plan_pkg_ident} patch --version") do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
    its('stdout') { should match /GNU patch #{plan_pkg_version}/ }
    its('stderr') { should be_empty }
  end
end