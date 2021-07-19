require_relative '../lib/caesar_cipher'

RSpec.describe CaesarCipher do
  describe '#encode' do
    context 'when shift is positive' do
      it 'encodes when shift is 1' do
        expect(subject.encode('abc', 1)).to eql('bcd')
      end
    end

    context 'when shift is negative' do
      it 'encodes when shift is -1' do
        expect(subject.encode('bcd', -1)).to eql('abc')
      end
    end

    context 'no change when minimized shift is 0' do
      it 'encodes when shift is 26' do
        expect(subject.encode('abc', 26)).to eql('abc')
      end

      it 'encodes when shift is -26' do
        expect(subject.encode('abc', 26)).to eql('abc')
      end
    end

    context 'when shift is minimized' do
      it 'encodes when shift is 27' do
        expect(subject.encode('abc', 27)).to eql('bcd')
      end

      it 'encodes when shift is -27' do
        expect(subject.encode('bcd', -27)).to eql('abc')
      end
    end

    context 'when message contains only alpha chars' do
      it 'encodes all alpha characters' do
        expect(subject.encode('AaBb', 1)).to eql('BbCc')
      end
    end

    context 'when message contains non-alpha chars' do
      it 'does not encode non-alpha characters' do
        expect(subject.encode('A!a B2b', 1)).to eql('B!b C2c')
      end
    end
  end
end
