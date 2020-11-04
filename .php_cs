<?php

$finder = PhpCsFixer\Finder::create()
    ->in(__DIR__)
    ->exclude('var')
;

return PhpCsFixer\Config::create()
->setRules([
        '@PHP56Migration' => true,
        '@PHP71Migration' => true,
        '@PHP73Migration' => true,
        '@Symfony' => true,
        '@Symfony:risky' => false,
        'align_multiline_comment' => true,
        'array_syntax' => ['syntax' => 'short'],
        'blank_line_before_statement' => true,
        'combine_consecutive_issets' => true,
        'combine_consecutive_unsets' => true,
        'general_phpdoc_annotation_remove' => ['annotations' => ['expectedException', 'expectedExceptionMessage', 'expectedExceptionMessageRegExp']],
        'heredoc_to_nowdoc' => true,
        'list_syntax' => ['syntax' => 'long'],
        'method_argument_space' => ['ensure_fully_multiline' => true],
        'no_extra_consecutive_blank_lines' => ['tokens' => ['break', 'continue', 'extra', 'return', 'throw', 'use', 'parenthesis_brace_block', 'square_brace_block', 'curly_brace_block']],
        'no_null_property_initialization' => true,
        'no_short_echo_tag' => true,
        'no_superfluous_elseif' => true,
        'no_superfluous_phpdoc_tags' => true,
        'no_unneeded_curly_braces' => true,
        'no_unneeded_final_method' => true,
        'no_unreachable_default_argument_value' => true,
        'no_useless_else' => true,
        'no_useless_return' => true,
        'ordered_class_elements' => false,
        'ordered_imports' => true,
        'php_unit_strict' => true,
        'php_unit_test_class_requires_covers' => true,
        'phpdoc_add_missing_param_annotation' => true,
        'phpdoc_order' => true,
        'phpdoc_types_order' => true,
        'semicolon_after_instruction' => true,
        'single_line_comment_style' => true,
        'strict_param' => false,
        'yoda_style' => false,
        'no_unreachable_default_argument_value' => false,
        'compact_nullable_typehint' => true,
        'self_accessor' => true
    ])
    ->setFinder($finder)
;
