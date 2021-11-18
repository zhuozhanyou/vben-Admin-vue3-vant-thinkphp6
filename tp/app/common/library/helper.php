<?php

namespace app\common\library;

/**
 * 工具类
 * Class helper
 * @package app\common\library
 */
class helper
{
    /**
     * 从object中选取属性
     * @param $source
     * @param array $columns
     * @return array
     */
    public static function pick($source, array $columns)
    {
        $dataset = [];
        foreach ($source as $key => $item) {
            in_array($key, $columns) && $dataset[$key] = $item;
        }
        return $dataset;
    }

    /**
     * 获取数组中指定的列
     * @param $source
     * @param $column
     * @return array
     */
    public static function getArrayColumn($source, $column): array
    {
        $columnArr = [];
        foreach ($source as $item) {
            isset($item[$column]) && $columnArr[] = $item[$column];
        }
        return $columnArr;
    }

    /**
     * 获取数组中指定的列 [支持多列]
     * @param $source
     * @param $columns
     * @return array
     */
    public static function getArrayColumns($source, $columns)
    {
        $columnArr = [];
        foreach ($source as $item) {
            $temp = [];
            foreach ($columns as $index) {
                $temp[$index] = $item[$index];
            }
            $columnArr[] = $temp;
        }
        return $columnArr;
    }

    /**
     * 把二维数组中某列设置为key返回
     * @param $source
     * @param $index
     * @return array
     */
    public static function arrayColumn2Key($source, $index)
    {
        $data = [];
        foreach ($source as $item) {
            $data[$item[$index]] = $item;
        }
        return $data;
    }

    public static function number2($number, $isMinimum = false, $minimum = 0.01)
    {
        $isMinimum && $number = max($minimum, $number);
        return sprintf('%.2f', $number);
    }

    public static function getArrayItemByColumn($array, $column, $value)
    {
        foreach ($array as $item) {
            if ($item[$column] == $value) {
                return $item;
            }
        }
        return false;
    }

    /**
     * 获取二维数组中指定字段的和
     * @param $array
     * @param $column
     * @return float|int
     */
    public static function getArrayColumnSum($array, $column)
    {
        $sum = 0;
        foreach ($array as $item) {
            $sum += $item[$column] * 100;
        }
        return $sum / 100;
    }

    /**
     * 在二维数组中查找指定值
     * @param array $array 二维数组
     * @param string $searchIdx 查找的索引
     * @param string $searchVal 查找的值
     * @return bool
     */
    public static function arraySearch($array, $searchIdx, $searchVal)
    {
        foreach ($array as $item) {
            if ($item[$searchIdx] == $searchVal) return $item;
        }
        return false;
    }

    public static function setDataAttribute(&$source, $defaultData, $isArray = false)
    {
        if (!$isArray) $dataSource = [&$source]; else $dataSource = &$source;
        foreach ($dataSource as &$item) {
            foreach ($defaultData as $key => $value) {
                $item[$key] = $value;
            }
        }
        return $source;
    }

    public static function bcsub($leftOperand, $rightOperand, $scale = 2)
    {
        return \bcsub($leftOperand, $rightOperand, $scale);
    }

    public static function bcadd($leftOperand, $rightOperand, $scale = 2)
    {
        return \bcadd($leftOperand, $rightOperand, $scale);
    }

    public static function bcmul($leftOperand, $rightOperand, $scale = 2)
    {
        return \bcmul($leftOperand, $rightOperand, $scale);
    }

    public static function bcdiv($leftOperand, $rightOperand, int $scale = 2)
    {
        return \bcdiv($leftOperand, $rightOperand, $scale);
    }

    public static function bccomp($leftOperand, $rightOperand, $scale = 2)
    {
        return \bccomp($leftOperand, $rightOperand, $scale);
    }

    public static function bcequal($leftOperand, $rightOperand, $scale = 2)
    {
        return self::bccomp($leftOperand, $rightOperand, $scale) === 0;
    }

    /**
     * 数组转为json
     * @param $data
     * @param int $options
     * @return string
     */
    public static function jsonEncode($data, int $options = JSON_UNESCAPED_UNICODE)
    {
        return json_encode($data, $options);
    }

    /**
     * json转义为数组
     * @param $json
     * @return array
     */
    public static function jsonDecode($json)
    {
        return json_decode($json, true);
    }

    /**
     * 检查目录是否可写
     * @param $path
     * @return bool
     */
    public static function checkWriteable($path)
    {
        try {
            !is_dir($path) && mkdir($path, 0755);
            if (!is_dir($path))
                return false;
            $fileName = $path . '/_test_write.txt';
            if ($fp = fopen($fileName, 'w')) {
                return fclose($fp) && unlink($fileName);
            }
        } catch (\Exception $e) {
        }
        return false;
    }

}
