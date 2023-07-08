require 'rails_helper'

RSpec.describe 'Categories', type: :system do
    describe 'Categories list index page' do
        before do
            @user = User.create!(name: 'Winnie', email: 'winnie@example.com', password: '000000')
            @category1 = Category.create!(name: 'Test Category1', icon: 'https://www.nicepng.com/png/detail/67-671448_test-image-png-testing-png.png')
            @category2 = Category.create!(name: 'Test Category2', icon: 'https://e7.pngegg.com/pngimages/575/704/png-clipart-computer-icons-test-scalable-graphics-test-score-angle-pencil.png')

            visit categories_path
            fill_in 'Email', with: @user.email
            fill_in 'Password', with: @user.password
            click_button 'Log in'
        end

        scenario 'A categories list is displayed on categories page' do
            expect(page).to have_content('Test Category1')
            expect(page).to have_content('Test Category2')
        end

        scenario 'An image of each category displayed on categories page' do
            expect(page).to have_css('img[src="https://www.nicepng.com/png/detail/67-671448_test-image-png-testing-png.png"]')
            expect(page).to have_css('img[src="https://e7.pngegg.com/pngimages/575/704/png-clipart-computer-icons-test-scalable-graphics-test-score-angle-pencil.png"]')
        end

        scenario 'When I click on view transaction button, I am redirected to that transaction index page.' do
            within(first('.category')) do
              click_link 'View Transaction'
            end
            expect(page).to have_current_path(category_records_path(@category1))
        end

        scenario 'When I click on remove btn, a category is deleted' do
            click_button 'Remove', id: "remove_btn-#{@category1.id}"
            expect(page).to_not have_content('Test Category1')
            expect(page).to have_content('Test Category2')
        end

        scenario 'When I click on Add New Category button, I am redirected to form to create a category.' do
            click_link 'Add New Category'
            expect(page).to have_current_path(new_category_path)
        end
    end
end