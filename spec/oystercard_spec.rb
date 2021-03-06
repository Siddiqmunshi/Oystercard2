
require "oystercard"

describe Oystercard do
  it "has a balance of zero" do
    expect(subject.balance).to eq(0)
  end
describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "can top up balance" do
      expect{subject.top_up 1}.to change{subject.balance}.by 1
    end

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE 
      subject.top_up(maximum_balance)
      expect{subject.top_up 1}.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end

    it "can deduct balance" do
      subject.top_up(50)
      expect{subject.deduct 1}.to change{subject.balance}.by -1
    end 


end
end

