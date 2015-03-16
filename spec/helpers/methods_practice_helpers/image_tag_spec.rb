require_relative '../../../helpers/methods_practice_helpers'

describe MethodsPracticeHelpers do
  include MethodsPracticeHelpersSpecHelpers
  include MethodsPracticeHelpers

  describe '#image_tag' do

    before(:each) do
      @src = random_string
      @alt = random_string
      @contents = html_of image_tag(@src, @alt)
      @image    = @contents.first
    end

    it 'returns only a single element' do
      expect( @contents.size ).to eq(1)
    end

    it 'returns an image tag' do
      expect( @image.name ).to eq('img')
    end

    describe 'the image tag' do

      before(:each) do
        attributes = @image.attributes
        @src_attr   = attributes['src']
        @alt_attr   = attributes['alt']
        @class_attr = attributes['class']
      end

      it 'has a src attribute' do
        expect(@src_attr).not_to eq(nil)
      end

      describe 'src attribute' do

        it 'is equal to the passed in source' do
          expect(@src_attr.value).to eq(@src)
        end

      end

      it 'has an alt attribute' do
        expect(@alt_attr).not_to eq(nil)
      end

      describe 'alt attribute' do

        it 'is equal to the passed in alternate text' do
          expect(@alt_attr.value).to eq(@alt)
        end

      end

      it 'has a class attribute' do
        expect(@class_attr).not_to eq(nil)
      end

      describe 'class attribute' do

        it 'includes exactly 2 classes' do
          expect( @class_attr.value.split(/\s+/).size ).to eq(2)
        end

        it 'includes "img-responsive"' do
          expect( @class_attr.value.include?('img-responsive') ).to eq(true)
        end

        it 'includes "img-thumbnail"' do
          expect( @class_attr.value.include?('img-thumbnail') ).to eq(true)
        end

      end

    end

  end

end