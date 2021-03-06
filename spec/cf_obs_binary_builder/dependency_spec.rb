describe CfObsBinaryBuilder::Dependency, '#obs_project' do
  let(:dependency) { CfObsBinaryBuilder::Dependency.new('1.2.3', '12345') }

  context "when OBS_PROJECT env variable is not set" do
    before(:each) do
      ENV.delete "OBS_PROJECT"
    end

    it "exits with error" do
      expect{ dependency.obs_project }.to raise_error(RuntimeError, "no OBS_PROJECT environment variable set")
    end
  end

  context "when OBS_PROJECT env variable is not set" do
    before(:each) do
      ENV["OBS_PROJECT"] = "home:ObsUser"
    end

    it "returns the correct value" do
      expect(dependency.obs_project).to eq("home:ObsUser")
    end
  end
end
