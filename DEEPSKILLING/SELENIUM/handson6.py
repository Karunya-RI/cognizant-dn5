from selenium import webdriver

driver = webdriver.Chrome()
driver.get("https://www.python.org")

driver.save_screenshot("python_home.png")
print("Screenshot saved!")

driver.quit()
