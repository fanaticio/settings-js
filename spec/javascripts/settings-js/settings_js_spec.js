describe('Settings ', function() {
  it('Settings object contains a valid json', function() {
    expected_json = {
      key1 : {
        sub_key1 :     'sub_value1',
      },
      sub_key2_2: {
        sub_key2_2_1 : 'sub_value2_2_1',
        sub_key2_2_2: {
          sub_key2_2_2_1: 'sub_value2_2_2_1'
        }
      }
    };

    expect(Settings).toEqual(expected_json);
  });
});
