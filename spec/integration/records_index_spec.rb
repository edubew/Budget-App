require 'rails_helper'

RSpec.describe 'Records', type: :system do
    describe 'Records list index page' do
        before do
            @user = User.create!(name: 'Winnie', email: 'winnie@example.com', password: '000000')
            @category = Category.create!(name: 'Test Category1', icon: 'https://www.nicepng.com/png/detail/67-671448_test-image-png-testing-png.png')
            @record1 = Record.create!(author_id: @user.id, name: 'Test Transaction1', amount: '300', categories: [@category])
            @record2 = Record.create!(author_id: @user.id, name: 'Test Transaction2', amount: '2000', categories: [@category])

            visit new_user_session_path

            fill_in 'Email', with: @user.email
            fill_in 'Password', with: @user.password
            click_button 'Log in'
        end

        scenario 'User can see the total amount for the category' do
            expect(page).to have_content("$#{@category.total_amount}")
        end

        scenario 'When I click on view transaction button, I am redirected to that transaction index page.' do
            click_link 'View Transaction'
            expect(page).to have_current_path(category_records_path(@category))
        end

        scenario 'A user can see a list of transactions' do
            click_link 'View Transaction'
            expect(page).to have_content('Test Transaction1')
            expect(page).to have_content('Test Transaction2')
        end

        scenario 'When I click on Add New Transaction button, I am redirected to form to create a transaction.' do
            within(first('.category')) do
                click_link 'View Transaction'
            end
            click_link 'Add New Transaction'
            expect(page).to have_current_path(new_category_record_path(@category))
        end
    end
end