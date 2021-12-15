require 'rails_helper'

describe ShortUrl, type: :model do
  describe 'validations' do
    subject { short_url }

    let(:short_url) { build :short_url }

    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:long_url) }
    it { should validate_presence_of(:shortened_url) }
    it { should validate_uniqueness_of(:code).case_insensitive }
  end

  describe 'scopes' do
    let!(:joathan_dev_br) { create :short_url }
    let!(:joathan_me) { create :short_url, :joathan_me }

    describe 'joathan_dev_br' do
      it 'return only short urls of joathan.dev.br domain' do
        expect(described_class.short).to include(joathan_dev_br)
        expect(described_class.short).not_to include(joathan_me)
      end
    end
  end

  describe '#self.generate' do
    let(:long_url) { 'http://www.joathan.dev.br' }

    context 'success' do
      context 'default domain' do
        before do
          create :short_url, code: '123', shortened_url: 'http://joathan.dev.br/acb'
          create :short_url, code: 'abC'

          expect(TokenGenerator)
            .to receive(:validation_code)
            .with(3)
            .and_return('123', 'abc', '12c')
        end

        it 'generates with uniq code' do
          short_url = ShortUrl.generate(long_url)
          expect(short_url).to have_attributes(long_url: long_url,
                                               shortened_url: 'http://joathan.dev.br/12c',
                                               code: '12c')
        end
      end

      context 'very big long_url' do
        let(:long_url) do
          "https://tecnoblog.net/538965/amazon-aws-esta-fora-do-ar-e-derruba-ifood-disney-lol-e-outros/"
        end

        before do
          create :short_url, code: '123'
          create :short_url, code: 'abC'

          expect(TokenGenerator)
            .to receive(:validation_code)
            .with(3)
            .and_return('123', 'abc', '12c')
        end

        it 'generates with uniq code' do
          short_url = ShortUrl.generate(long_url)
          expect(short_url).to have_attributes(long_url: long_url,
                                               shortened_url: 'http://joathan.dev.br/12c',
                                               code: '12c')
        end
      end
    end

    context 'without long_url' do
      it 'returns nil' do
        expect(ShortUrl.generate(nil)).to be_nil
      end
    end
  end
end
