Facter.add(:hpcusers) do
  setcode do
    hpcusers = Hash.new
    begin
      File.readlines("/shared/adquery/user_list.txt").each do |line|
        name, uid = line.strip!.split(":")
        hpcusers[name] = uid
      end
    rescue
    end
    hpcusers
  end
end

