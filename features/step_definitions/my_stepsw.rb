p = "C:/Users/melehin_a/cucu/gittest/drivers/chromedriver.exe"
Given(/^I open a browser and navigate to start URL$/) do
  @browser = Selenium::WebDriver.for :chrome, driver_path:p
  url ="https://gregory-test-guru.herokuapp.com/"
  @browser.navigate.to url
end

When (/^I open login page$/) do
  @browser.find_element(xpath: "//a[@class='nav-link' and text() = 'Login']").click
  sleep 3
end

And (/I enter email "([^"]*)" and password "([^"]*)"$/) do |email, password|
  @browser.find_element(xpath: "//*[@id='user_email']").send_keys email
  @browser.find_element(xpath: "//*[@id='user_password']").send_keys password
  @browser.find_element(xpath: "//input[@type='submit']").click
end


Then (/I can create new topic$/) do
  for i in (1..3)
    @browser.find_element(xpath: "//a[@class='badge badge-success' and text()='Создать новый тест']").click
    sleep 1
    @browser.find_element(xpath: "//*[@id='test_title']").send_keys("New topic #{i}")
    @browser.find_element(xpath: "//*[@id='test_level']").send_keys(i)
    @browser.find_element(xpath: "//*[@id='test_category_id']").click
    @browser.find_element(xpath: "//option[@value='1']").click
    @browser.find_element(xpath: "//input[@type='submit']").click
  end
end

#some comment
#some
