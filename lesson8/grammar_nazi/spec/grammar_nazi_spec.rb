require 'grammar_nazi'

RSpec.describe GrammarNazi, '#check' do
  let(:checker) { GrammarNazi.new }

  context 'with errors' do
    before { checker.check 'чуство ветренный' }

    it 'includes errors' do
      expect(checker.errors.count).to eq 2
    end
  end

  context 'no errors' do
    before { checker.check 'чувство ветреный' }

    it 'includes no errors' do
      expect(checker.errors.count).to eq 0
    end
  end
end
