require_relative '../../../helpers/methods_practice_helpers'

describe MethodsPracticeHelpers do
  include MethodsPracticeHelpersSpecHelpers
  include MethodsPracticeHelpers

  describe '#bootstrap_alert' do

    context 'when passed both a message and a type' do

      before(:each) do
        @message  = random_string
        @type     = random_string
        @contents = html_of bootstrap_alert(@message, @type)
        @alert    = @contents.first
      end

      it 'returns only a single element' do
        expect( @contents.size ).to eq(1)
      end

      it 'returns a div tag' do
        expect( @alert.name ).to eq('div')
      end

      describe 'div tag' do

        before(:each) do
          attributes = @alert.attributes

          @class_attr = attributes['class']
          @role_attr  = attributes['role']

          @button = @alert.children.find { |child| child.name == 'button' }
          @text   = @alert.children.find { |child| child.is_a?(Nokogiri::XML::Text) }
        end

        it 'has a class attribute' do
          expect(@class_attr).not_to eq(nil)
        end

        describe 'class attribute' do

          it 'includes exactly 3 classes' do
            expect( @class_attr.value.split(/\s+/).size ).to eq(3)
          end

          it 'includes "alert"' do
            expect( @class_attr.value.include?('alert') ).to eq(true)
          end

          it 'includes "alert-TYPE"' do
            expect( @class_attr.value.include?("alert-#{@type}") ).to eq(true)
          end

          it 'includes "alert-dismissible"' do
            expect( @class_attr.value.include?('alert-dismissible') ).to eq(true)
          end

        end

        it 'has a role attribute' do
          expect(@role_attr).not_to eq(nil)
        end

        describe 'role attribute' do

          it 'is equal to "alert"' do
            expect(@role_attr.value).to eq('alert')
          end

        end

        it 'contains exactly 2 elements' do
          expect( @alert.children.size ).to eq(2)
        end

        it 'contains a button' do
          expect( @button ).not_to eq(nil)
        end

        describe 'button' do

          before(:each) do
            attributes = @button.attributes

            @type_attr         = attributes['type']
            @class_attr        = attributes['class']
            @data_dismiss_attr = attributes['data-dismiss']
            @aria_label_attr   = attributes['aria-label']

            @span = @button.children.find { |child| child.name == 'span' }
          end

          it 'has a type attribute' do
            expect(@type_attr).not_to eq(nil)
          end

          describe 'type attribute' do

            it 'is equal to "button"' do
              expect(@type_attr.value).to eq('button')
            end

          end

          it 'has a class attribute' do
            expect(@class_attr).not_to eq(nil)
          end

          describe 'class attribute' do

            it 'is equal to "close"' do
              expect(@class_attr.value).to eq('close')
            end

          end

          it 'has a data-dismiss attribute' do
            expect(@data_dismiss_attr).not_to eq(nil)
          end

          describe 'data-dismiss attribute' do

            it 'is equal to "alert"' do
              expect(@data_dismiss_attr.value).to eq('alert')
            end

          end

          it 'has a aria-label attribute' do
            expect(@aria_label_attr).not_to eq(nil)
          end

          describe 'aria-label attribute' do

            it 'is equal to "Close"' do
              expect(@aria_label_attr.value).to eq('Close')
            end

          end

          it 'contains exactly 1 element' do
            expect( @button.children.size ).to eq(1)
          end

          it 'contains a span tag' do
            expect(@span).not_to eq(nil)
          end

          describe 'span tag' do

            before(:each) do
              attributes = @span.attributes

              @aria_hidden_attr = attributes['aria-hidden']

              @text = @span.children.find { |child| child.is_a?(Nokogiri::XML::Text) }
            end

            it 'has an aria-hidden attribute' do
              expect(@aria_hidden_attr).not_to eq(nil)
            end

            describe 'aria-hidden attribute' do

              it 'is equal to "true"' do
                expect(@aria_hidden_attr.value).to eq('true')
              end

            end

            it 'contains exactly 1 element' do
              expect( @span.children.size ).to eq(1)
            end

            it 'contains text' do
              expect(@text).not_to eq(nil)
            end

            describe 'the text' do

              it 'is equal to "×" (i.e. "&times;")' do
                expect(@text.to_s).to eq('×')
              end

            end

          end

        end

        it 'contains text' do
          expect(@text).not_to eq(nil)
        end

        describe 'the text' do

          it 'is equal to the message passed in' do
            expect(@text.to_s).to eq(@message)
          end

        end

      end

    end

    context 'when passed only a message' do

      before(:each) do
        @message  = random_string
        @contents = html_of bootstrap_alert(@message)
        @alert    = @contents.first
      end

      describe 'div tag' do

        before(:each) do
          attributes = @alert.attributes
          @class_attr = attributes['class']
        end

        describe 'class attribute' do

          it 'includes "alert-info"' do
            expect( @class_attr.value.include?('alert-info') ).to eq(true)
          end

        end

      end

    end

  end

end

# <div class="alert alert-<TYPE-GOES-HERE> alert-dismissible" role="alert">
#   <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
#   <MESSAGE-GOES-HERE>
# </div>