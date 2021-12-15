require 'rails_helper'

describe TokenGenerator do
  describe 'validation code' do
    it 'tokens dont have confusing characters' do
      expect(described_class.validation_code(10_000))
        .not_to include('0', 'O', 'I')
    end

    it 'tokens dont have symbols' do
      expect(described_class.validation_code(10_000))
        .not_to include('!', '@', '#', '$')
    end

    it 'tokens have normal characters' do
      expect(described_class.validation_code(10_000))
        .to include('A', 'B', 'C', 'D')
    end
  end
end
