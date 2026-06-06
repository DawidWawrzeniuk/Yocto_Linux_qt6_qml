#include <gpiod.h>
#include <iostream>
#include <fstream>
#include <unistd.h>
#include <ctime>

int main() {
    const char *chipname = "/dev/gpiochip0";
    unsigned int line_offset = 17;

    gpiod_chip *chip = gpiod_chip_open(chipname);
    if (!chip) {
        std::cerr << "Cannot open chip\n";
        return 1;
    }

    const gpiod_line_settings *settings = nullptr;
    gpiod_line_config *line_cfg = gpiod_line_config_new();

    gpiod_line_settings *ls = gpiod_line_settings_new();
    gpiod_line_settings_set_direction(ls, GPIOD_LINE_DIRECTION_INPUT);

    gpiod_line_config_add_line_settings(line_cfg, &line_offset, 1, ls);

    gpiod_request_config *req_cfg = gpiod_request_config_new();
    gpiod_request_config_set_consumer(req_cfg, "gpio-reader");

    gpiod_line_request *request =
        gpiod_chip_request_lines(chip, req_cfg, line_cfg);

    if (!request) {
        std::cerr << "Request failed\n";
        return 1;
    }

    std::ofstream file("/tmp/gpio_log.txt", std::ios::app);

    while (true) {
        int value = gpiod_line_request_get_value(request, line_offset);

        std::time_t t = std::time(nullptr);

        file << t << " gpio" << line_offset << "=" << value << std::endl;
        file.flush();

        std::cout << "GPIO=" << value << std::endl;

        usleep(500000);
    }

    gpiod_line_request_release(request);
    gpiod_chip_close(chip);

    return 0;
}
